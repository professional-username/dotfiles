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
    class_names: [`id_${index + 1}`, "workspace_button"],
    on_clicked: () => { hyprland.messageAsync(`dispatch workspace ${index + 1}`) },
    // The button labels
    child: Widget.Label({
      class_name: active_id.as(id => `active_${id == index + 1}`),
      label: "•",
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
