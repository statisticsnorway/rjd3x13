#' @importFrom RProtoBuf readProtoFiles2
#' @importFrom stats is.ts start
#' @include utils.R


.onLoad <- function(libname, pkgname) {

  if (!requireNamespace("rjd3toolkit", quietly = TRUE)) stop("Loading rjd3 libraries failed")

    result <- .jpackage(pkgname, lib.loc=libname)
  if (!result) stop("Loading java packages failed")

  proto.dir <- system.file("proto", package = pkgname)
  readProtoFiles2(protoPath = proto.dir)

  # reload extractors
  rjd3toolkit::reload_dictionaries()

}
