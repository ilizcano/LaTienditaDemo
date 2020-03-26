using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace LaTiendita.Models
{
    public class UserModel
    {
        public int UserId { get; set; }

        [DisplayName("Correo:")]
        [Required(ErrorMessage = "El correo es requerido")]
        [RegularExpression("^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$", ErrorMessage = "Formato de correo invalido")]
        public string Email { get; set; }

        [DisplayName("Usuario:")]
        [Required(ErrorMessage = "El usuario es requerido")]
        public string Name { get; set; }

        [DisplayName("Tu saldo es:")]
        public double Balance { get; set; }

        public bool IsDeleted { get; set; }
    }
}