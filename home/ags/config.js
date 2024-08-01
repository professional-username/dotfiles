// main scss file
const scss = `${App.configDir}/sass/style.scss`

// target css file
const css = `/tmp/my-style.css`

// make sure sassc is installed on your system
Utils.exec(`sassc ${scss} ${css}`)


const hyprland = await Service.import("hyprland");

// --- Widgets ---

function nixMenu() {
  return Widget.Label(" ")
}

function workspaces() {
  // Generate a row of button widgets that respond to hprland's workspaces
  const active_id = hyprland.active.workspace.bind("id");
  const workspaceButtons = Array.from({ length: 10 }, (_, index) => Widget.Button({
    class_names: active_id.as(id => [
      "ws__button",
      `ws__button--id-${index + 1}`,
      `ws__button--${id === index + 1 ? "active" : "inactive"}`
    ]),

    on_clicked: () => { hyprland.messageAsync(`dispatch workspace ${index + 1}`) },
    child: Widget.Label({
      class_name: "ws__label",
      label: "",
      // Change the label based on whether the workspace exists / is occupied
      setup: self => self.hook(hyprland, () => {
        self.label = hyprland.workspaces.some(ws => ws.id === index + 1)
          ? "" : ""
      }),
    })
  }));

  return Widget.Box({
    class_name: "ws",
    children: workspaceButtons,
  });
}

function Clock() {
  return Widget.Label({
    class_name: "clock",
    label: date.bind(),
  })
}

// --- Positioning ---

function barLeft() {
  return Widget.Box({
    class_name: "bar__left",
    hpack: "start",
    spacing: 8,
    children: [
      nixMenu(),
      workspaces(),
    ],
  })
}


const date = Variable("", {
  poll: [1000, 'date "+%H:%M"'],
})

function barCenter() {
  return Widget.Box({
    class_name: "bar__center",
    hpack: "center",
    spacing: 8,
    children: [Widget.Label("")],
  })
}

function barRight() {
  return Widget.Box({
    class_name: "bar__right",
    hpack: "end",
    spacing: 8,
    children: [
      Clock(),
    ],
  })
}

function Bar(monitor = 0) {
  return Widget.Window({
    class_name: "bar",
    monitor,
    name: `bar${monitor}`, // this name has to be unique
    anchor: ['bottom', 'left', 'right'],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
      class_name: "bar__body",
      spacing: 8,
      start_widget: barLeft(),
      center_widget: barCenter(),
      end_widget: barRight(),
    }),
  })
}

App.config({
  style: css,
  windows: [
    Bar(),
  ],
})
