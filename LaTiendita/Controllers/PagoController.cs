using LaTiendita.Services;
using LaTiendita.Services.Interfaces;
using LaTiendita.Models;
using System;
using System.Web.Mvc;

namespace LaTiendita.Controllers
{
    public class PagoController : Controller
    {
        private readonly IPaymentService PaymentService;
        private readonly IUserService UserService;
        public PagoController(IPaymentService paymentService, IUserService userService) {
            PaymentService = paymentService;
            UserService = userService;
        }
        // GET: Pago
        public ActionResult Index()
        {
            PaymentModel model = new PaymentModel();
            model.IsNew = true;
            model.Balance = UserService.GetUserByName("demoUser").Balance;
            return View(model);
        }

        public JsonResult GetPayment()
        {
            var result = PaymentService.GetPayments();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Index(PaymentModel model)
        {
            model.IsNew = false;
            model.IsValid = ModelState.IsValid;
            if (ModelState.IsValid)
            {

                var currentUser = UserService.GetUserByName("demoUser");/*TODO: change to current user*/

                PaymentService.SavePayment(new Model.Payment
                {
                    Amount = model.Amount,
                    UserId = currentUser == null ? 0 : currentUser.UserId,
                    IsDeleted = false,
                    CreationDate = DateTime.Now,
                    UpdateDate = DateTime.Now
                });

                UserService.UpdateBalance(currentUser.UserId, model.Amount);
                return RedirectToActionPermanent("Index", "Home");
            } else {
                return PartialView(model);
            }
        }
    }
}