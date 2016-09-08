/*
** mrb_fileutils.c - FileUtils class
**
** Copyright (c) OKUMURA Takahiro 2016
**
** See Copyright Notice in LICENSE
*/

#include "mruby.h"
#include "mruby/data.h"
#include "mrb_fileutils.h"

#define DONE mrb_gc_arena_restore(mrb, 0);

void mrb_mruby_fileutils_gem_init(mrb_state *mrb)
{
  struct RClass *fileutils;
  struct RClass *fileutils_verbose;
  struct RClass *fileutils_nowrite;
  struct RClass *fileutils_dryrun;

  fileutils = mrb_define_module(mrb, "FileUtils");
  fileutils_verbose = mrb_define_module_under(mrb, fileutils, "Verbose");
  fileutils_nowrite = mrb_define_module_under(mrb, fileutils, "NoWrite");
  fileutils_dryrun = mrb_define_module_under(mrb, fileutils, "DryRun");

  DONE;
}

void mrb_mruby_fileutils_gem_final(mrb_state *mrb)
{
}
