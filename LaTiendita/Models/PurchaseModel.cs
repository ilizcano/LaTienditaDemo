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
        public int ProductId { get; set; }
        
        [DisplayName("Cantidad:")]
        public int Quantity { get; set; }

        [DisplayName("Precio:")]
        public decimal Price { get; set; }

        [DisplayName("Total:")]
        public decimal Total { get; set; }
    }
}