defmodule ExAdmin.Theme.ActiveAdmin.Table do
  @moduledoc false
  import ExAdmin.Table
  import ExAdmin.Gettext
  alias ExAdmin.Utils
  use Xain

  @table_opts [border: "0", cellspacing: "0", cellpadding: "0"]

  def theme_panel(conn, schema) do
    markup do
      div ".panel" do
        h3(schema[:name] || "")

        div ".panel_contents" do
          do_panel(conn, schema, @table_opts)
        end
      end
    end
  end

  def theme_attributes_table(conn, resource, schema, resourceModel) do
    markup do
      div ".panel" do
        resource_model = ExAdmin.Helpers.app_gettext(resourceModel)
        h3(
          schema[:name] ||
            # gettext("%{resource_model} Details", resource_model: Utils.humanize(resource_model))
            gettext("%{resource_model} Details", resource_model: resource_model)
        )

        do_attributes_table_for(conn, resource, resourceModel, schema, @table_opts)
      end
    end
  end

  def theme_attributes_table_for(conn, resource, schema, resource_model) do
    do_attributes_table_for(conn, resource, resource_model, schema, @table_opts)
  end
end
