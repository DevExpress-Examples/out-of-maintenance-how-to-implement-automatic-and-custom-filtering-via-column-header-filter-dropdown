<%@ Control Language="vb" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%
	Html.DevExpress().GridView(Function(settings) AnonymousMethod1(settings)).Bind(Model).Render()
%>

'INSTANT VB TODO TASK: The return type of this anonymous method could not be determined by Instant VB:
private object AnonymousMethod1(object settings)
{
	settings.Name = "dxGridView";
	settings.CallbackRouteValues = New { Controller = "GridView", Action = "FilteringPartial" };
	settings.Settings.ShowHeaderFilterButton = True;
	settings.Columns.Add("ShipName");
	settings.Columns.Add("Quantity").PropertiesEdit.DisplayFormatString = "c";
	settings.HeaderFilterFillItems = (sender, e) =>
	{
		ASPxGridView grid = (ASPxGridView)sender;
		if(!object.Equals(e.Column, grid.Columns["Quantity"]))
			Return;
			int max = 0;
			for(int i = 0; i < e.Values.Count; i += 1)
			{
				int value;
				if(!int.TryParse(e.Values[i].Value, out value))
					continue;
					if(value > max)
						max = value;
			}
			e.Values.Clear();
			e.AddShowAll();
			int step = 10;
			for(int i = 0; i < max / step + 1; i += 1)
			{
				int start = step * i;
				int end = start + step - 1;
				e.AddValue(string.Format("from {0} to {1}", start, end), string.Empty, string.Format("[Quantity] >= {0} and [Quantity] <= {1}", start, end));
			}
	};
}