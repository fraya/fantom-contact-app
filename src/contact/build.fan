#! /usr/bin/env fan

using build

class Build : build::BuildPod
{
  new make()
  {
    podName = "contact"
    summary = "Contact app made with hypermedia"
    version = Version("1.0")

    meta = [
    //   "org.name":     "My Org",
    //   "org.uri":      "http://myorg.org/",
      "proj.name":    "Contact App",
    //   "proj.uri":     "http://myproj.org/",
    //   "license.name": "Apache License 2.0",
       "vcs.name":     "Git",
       "vcs.uri":      "https://github.com/fraya/contact"
    ]

    depends = [
      "sys 1.0",
      "sql 1.0",
      "concurrent 1.0",
      "util 1.0",
      "web 1.0",
      "webmod 1.0",
      "wisp 1.0",
      "mustache 1.0 "
    ]

    srcDirs = [
      `fan/`,
      `fan/media/`,
      `fan/mod/`,
      `fan/model/`,
      `fan/service/`,
      `fan/sql/`,
      `fan/view/`,
      `test/`
    ]

    resDirs  = [
      `web/`,
      `res/`,
      `res/sql/sqlite/`
    ]

    // javaDirs = [,]
    // jsDirs   = [,]
    // docApi   = false   // defaults to 'true'
    // docSrc   = true    // defaults to 'false'
  }
}
