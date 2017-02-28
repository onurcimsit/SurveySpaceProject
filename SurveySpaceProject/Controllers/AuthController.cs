using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SurveySpaceProject.Models;
using System.Security.Claims;

namespace SurveySpaceProject.Controllers
{
    [AllowAnonymous]
    public class AuthController : Controller
    {
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (!ModelState.IsValid)
                return View(model);

            if(model.Email == "admin" && model.Password == "admin")
            {
                //succesfull
                var identity = new ClaimsIdentity(new[] {
                    new Claim(ClaimTypes.Name, model.Email)
                    }, "ApplicationCookie");
                Request.GetOwinContext().Authentication.SignIn(identity);
                //return RedirectToAction("Index", "");
                return View(model);
            }

            ModelState.AddModelError("", "Invalid user name!");
            return View(model);
        }

        public ActionResult Register(LoginModel model)
        {
            if (!ModelState.IsValid)
                return View(model);

            return RedirectToAction("Login");
        }

        public ActionResult Logout()
        {
            Request.GetOwinContext().Authentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}