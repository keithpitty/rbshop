#include "ruby.h"

VALUE RBShopModule = Qnil;

void
Init_rbshop()
{
  RBShopModule = rb_define_module("RBShop");
  rbshop_define_image_class();
}
