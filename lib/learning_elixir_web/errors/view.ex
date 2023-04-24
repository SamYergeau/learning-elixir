defmodule LearningElixirWeb.Errors.View do
  use Phoenix.View, root: "lib/learning_elixir_web", path: "errors/templates", namespace: LearningElixirWeb

  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
