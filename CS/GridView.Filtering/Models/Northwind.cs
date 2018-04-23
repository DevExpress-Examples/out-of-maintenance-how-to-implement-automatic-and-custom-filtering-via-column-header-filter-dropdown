using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace GridView.Filtering.Models {
    public static class NorthwindDataProvider {
        static NorthwindDataContext db;
        public static NorthwindDataContext DB {
            get {
                if(db == null)
                    db = new NorthwindDataContext();
                return db;
            }
        }
        public static IEnumerable GetInvoices() {
            return from invoice in DB.Invoices select invoice;
        }
    }
}