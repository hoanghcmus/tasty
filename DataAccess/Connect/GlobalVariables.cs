using System.Web;
using System.Collections.Generic;

namespace DataAccess.Classes
{
    public class GlobalVariables
    {
        public static User CurrUser
        {
            get
            {
                if (HttpContext.Current.Session["CurrUser"] == null)
                    return null;

                return (User)HttpContext.Current.Session["CurrUser"];
            }
            set
            {
                HttpContext.Current.Session["CurrUser"] = value;
            }
        }
        public static User CurrUserInternal
        {
            get
            {
                if (HttpContext.Current.Session["CurrUserInternal"] == null)
                    return null;

                return (User)HttpContext.Current.Session["CurrUserInternal"];
            }
            set
            {
                HttpContext.Current.Session["CurrUserInternal"] = value;
            }
        }
        public static string[] CurrCustomerInfo
        {
            get
            {
                if (HttpContext.Current.Session["CurrCustomerInfo"] == null)
                    return new string[15];

                return (string[])HttpContext.Current.Session["CurrCustomerInfo"];
            }
            set
            {
                HttpContext.Current.Session["CurrCustomerInfo"] = value;
            }
        }
        public static int OrderReqID
        {
            get
            {
                if (HttpContext.Current.Session["OrderReqID"] == null)
                    return 0;
                return (int)HttpContext.Current.Session["OrderReqID"];
            }
            set
            {
                HttpContext.Current.Session["OrderReqID"] = value;
            }
        }
        public static List<int> SessionMemberArray
        {
            get
            {
                if (HttpContext.Current.Session["SessionMemberArray"] == null)
                    return new List<int>();

                return (List<int>)HttpContext.Current.Session["SessionMemberArray"];
            }
            set
            {
                HttpContext.Current.Session["SessionMemberArray"] = value;
            }
        }
        public static List<int> SessionMemberInternal
        {
            get
            {
                if (HttpContext.Current.Session["SessionMemberInternal"] == null)
                    return new List<int>();

                return (List<int>)HttpContext.Current.Session["SessionMemberInternal"];
            }
            set
            {
                HttpContext.Current.Session["SessionMemberInternal"] = value;
            }
        }
        public static bool ContactSent
        {
            get
            {
                if (HttpContext.Current.Session["ContactSent"] == null)
                    return false;
                return (bool)HttpContext.Current.Session["ContactSent"];
            }
            set
            {
                HttpContext.Current.Session["ContactSent"] = value;
            }
        }
    }
}