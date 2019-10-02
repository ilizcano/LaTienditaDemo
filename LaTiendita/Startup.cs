using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LaTiendita.Startup))]
namespace LaTiendita
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            UnityConfig.RegisterComponents();
        }
    }
}
