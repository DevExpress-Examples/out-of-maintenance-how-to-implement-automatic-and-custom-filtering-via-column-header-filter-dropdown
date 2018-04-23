Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.Mvc
Imports GridView.Filtering.Models

Namespace GridView.Filtering.Controllers
	<HandleError> _
	Public Class GridViewController
		Inherits Controller
		Public Function Index() As ActionResult
			Return Filtering()
		End Function
		Public Function Filtering() As ActionResult
			Return View("Filtering", NorthwindDataProvider.GetInvoices())
		End Function
		Public Function FilteringPartial() As ActionResult
			Return PartialView("FilteringPartial", NorthwindDataProvider.GetInvoices())
		End Function
	End Class
End Namespace
