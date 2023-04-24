defmodule LearningElixirWeb.Layouts.View do
  use Phoenix.View, root: "lib/learning_elixir_web", path: "layouts/templates", namespace: LearningElixirWeb
  use Phoenix.HTML

  import Phoenix.Controller, only: [get_flash: 2]

  alias LearningElixirWeb.Router.Helpers, as: Routes
end
