﻿using LaTiendita.Model;
using System;
using System.Configuration;
using System.Data.Entity;

namespace LaTiendita.DataAccess
{
    public class AppContext: DbContext
    {
        IDbSet<Product> Products { get; set; }
        IDbSet<Purchase> Purchases { get; set; }
        IDbSet<User> Users { get; set; }
        IDbSet<Payment> Payments { get; set; }
        public AppContext()
            :base(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString)
        {
        }

        public new void Dispose()
        {
            base.Dispose();
            GC.SuppressFinalize(this);
        }
    }
}
