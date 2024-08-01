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
  const active_id = hyprland.active.workspace.bind("id");
  // The button widgets
  const workspaceButtons = Array.from({ length: 10 }, (_, index) => Widget.Button({
    class_names: active_id.as(id => [
      "ws__button",
      `ws__button--id-${index + 1}`,
      `ws__button--${id === index + 1 ? "active" : "inactive"}`
    ]),
    // attribute: index + 1,

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
    class_name: "workspaces",
    children: workspaceButtons,

  });
}

// --- Positioning ---

function barLeft() {
  return Widget.Box({
    spacing: 8,
    children: [
      nixMenu(),
      workspaces(),
    ],
  })
}
function barCenter() {
  return Widget.Box({
    class_name: "centerText",
    spacing: 8,
    children: [Widget.Label("center")],
  })
}

function barRight() {
  return Widget.Box({
    spacing: 8,
    children: [Widget.Label("right")],
  })
}

function Bar(monitor = 0) {
  return Widget.Window({
    monitor,
    name: `bar${monitor}`, // this name has to be unique
    anchor: ['bottom', 'left', 'right'],
    exclusivity: "exclusive",
    child: Widget.CenterBox({
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
