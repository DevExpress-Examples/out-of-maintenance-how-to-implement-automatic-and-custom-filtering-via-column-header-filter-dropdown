<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
    Html.DevExpress().GridView(settings => {
        settings.Name = "dxGridView";
        settings.CallbackRouteValues = new { Controller = "GridView", Action = "FilteringPartial" };
        settings.Settings.ShowHeaderFilterButton = true;

        settings.Columns.Add("ShipName");
        settings.Columns.Add("Quantity").PropertiesEdit.DisplayFormatString = "c";

        settings.HeaderFilterFillItems = (sender, e) => {
            ASPxGridView grid = (ASPxGridView)sender;
            if(!object.Equals(e.Column, grid.Columns["Quantity"])) return;
            
            int max = 0;
            for(int i = 0; i < e.Values.Count; i++) {
                int value;
                if(!int.TryParse(e.Values[i].Value, out value)) continue;
                if(value > max) max = value;
            }
            e.Values.Clear();
            e.AddShowAll();
            int step = 10;
            for(int i = 0; i < max / step + 1; i++) {
                int start = step * i;
                int end = start + step - 1;
                e.AddValue(string.Format("from {0} to {1}", start, end), string.Empty, string.Format("[Quantity] >= {0} and [Quantity] <= {1}", start, end));
            }
        };
    })
    .Bind(Model)
    .Render();
%>