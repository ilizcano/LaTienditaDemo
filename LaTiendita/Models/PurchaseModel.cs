using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;

namespace LaTiendita.Models
{
    public class PurchaseModel
    {
        [DisplayName("Producto:")]
        public string Product { get; set; }
        [DisplayName("Cantidad:")]
        public int Amount { get; set; }
        [DisplayName("Precio:")]
        public decimal Price { get; set; }
    }
}