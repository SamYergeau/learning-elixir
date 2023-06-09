defmodule LearningElixirGraphQL.Schema do
  use Absinthe.Schema

  alias LearningElixir.Repo

  import_types(Absinthe.Type.Custom)
  import_types(LearningElixirGraphQL.Application.Types)

  query do
    import_fields(:application_queries)
  end

  # Having an empty mutation block is invalid and raises an error in Absinthe.
  # Uncomment it when you add the first mutation.
  #
  # mutation do
  # end

  def context(context) do
    Map.put(context, :loader, Dataloader.add_source(Dataloader.new(), Repo, Dataloader.Ecto.new(Repo)))
  end

  def plugins do
    [Absinthe.Middleware.Dataloader] ++ Absinthe.Plugin.defaults()
  end

  def middleware(middleware, _, _) do
    [NewRelic.Absinthe.Middleware, LearningElixirGraphQL.Middleware.OperationNameLogger] ++ middleware
  end
end
