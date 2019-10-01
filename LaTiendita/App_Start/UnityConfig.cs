using LaTiendita.DataAccess;
using LaTiendita.DataAccess.Interfaces;
using LaTiendita.Services;
using LaTiendita.Services.Interfaces;
using System.Web.Mvc;
using Unity;
using Unity.Mvc5;

namespace LaTiendita
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();

            // register all your components with the container here
            container.RegisterType<IUnitOfWork, UnitOfWork>();
            container.RegisterType<IProductsService, ProductsService>();

            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}