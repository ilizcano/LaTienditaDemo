using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaTiendita.Models
{
    public class PaymentModel
    {
        [DisplayName("User:")]
        [Required(ErrorMessage = "El Usuario es requerido")]
        public int UserId { get; set; }

        [DisplayName("Cantidad:")]
        [RegularExpression(@"^\d+.\d{0,2}$", ErrorMessage = "Solo numeros con dos decimales permitidos")]
        [Required(ErrorMessage = "La Cantidad es requerida")]
        public double Amount { get; set; }

        [DisplayName("Saldo:")]
        public double Balance { get; set; }

        [DisplayName("Nuevo Saldo:")]
        public double NewBalance { get; set; }

        public int PaymentId { get; set; }

        public bool IsValid { get; set; }

        public bool IsNew { get; set; }
    }
}