defmodule Rumbl.Repo do
  # use Ecto.Repo, otp_app: :rumbl
  #
  # @doc """
  # Dynamically loads the repository url from the
  # DATABASE_URL environment variable.
  # """
  # def init(_, opts) do
  #   {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  # end
  #
  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "José", username: "josevalim", password: "elixir"},
      %Rumbl.User{id: "2", name: "Bruce", username: "redrapids", password: "7langs"},
      %Rumbl.User{id: "3", name: "Chris", username: "chrismccord", password: "phx"}
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    all(module) |> Enum.find(fn record -> record.id == id end)
  end

  def get_by(module, params) do
    all(module) |> Enum.find(fn record ->
      Enum.all?(params, fn {key, value} -> Map.get(record, key) == value end)
    end)
  end
end
