using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaTiendita.Models
{
    public class PurchaseModel
    {
        [DisplayName("Producto:")]
        [Required(ErrorMessage ="El Producto es requerido")]
        public int ProductId { get; set; }
        
        [DisplayName("Cantidad:")]
        [Required(ErrorMessage = "La Cantidad es requerida")]
        [RegularExpression("([1-9][0-9]*)", ErrorMessage = "Solo numeros enteros positivos permitidos")]
        public int Quantity { get; set; }

        [DisplayName("Precio:")]
        [Required(ErrorMessage = "El Precio es requerido")]
        public decimal Price { get; set; }

        [DisplayName("Total:")]
        [Required(ErrorMessage = "El Total es requerido")]
        public decimal Total { get; set; }

        public bool IsValid { get; set; }
        public bool IsNew { get; set; }
    }
}