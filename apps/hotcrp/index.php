<?php
// index.php -- HotCRP home page
// HotCRP is Copyright (c) 2006-2015 Eddie Kohler and Regents of the UC
// Distributed under an MIT-like license; see LICENSE

require_once("record_lib.php");

//if (function_exists("get_req_no")) {
//  header("X-RID: " . get_req_no());
//}

require_once("lib/navigation.php");
if (Navigation::page() !== "index") {
    $page = Navigation::page();
    if (is_readable("$page.php")
        /* The following is paranoia (currently can't happen): */
        && strpos($page, "/") === false) {
        include("$page.php");
        exit;
    } else if ($page == "images" || $page == "scripts" || $page == "stylesheets") {
        if (function_exists("set_res_req")) {
          set_res_req(true);
        }
        $_REQUEST["file"] = $page . Navigation::path();
        include("cacheable.php");
        exit;
    } else
        Navigation::redirect_site("index");
}

require_once("pages/home.php");
