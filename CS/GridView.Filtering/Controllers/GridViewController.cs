using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GridView.Filtering.Models;

namespace GridView.Filtering.Controllers {
    [HandleError]
    public class GridViewController : Controller {
        public ActionResult Index() {
            return Filtering();
        }
        public ActionResult Filtering() {
            return View("Filtering", NorthwindDataProvider.GetInvoices());
        }
        public ActionResult FilteringPartial() {
            return PartialView("FilteringPartial", NorthwindDataProvider.GetInvoices());
        }
    }
}
