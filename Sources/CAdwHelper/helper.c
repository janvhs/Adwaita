#include "helper.h"
#include <adwaita.h>

GApplication *swadw_g_application_from_adw_application(AdwApplication *app) {
  return G_APPLICATION(app);
}
