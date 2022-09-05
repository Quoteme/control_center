set(CMAKE_CXX_COMPILER "/nix/store/mp5s94sca8qyy0sgrz7306b9q8pwdbw1-clang-wrapper-11.1.0/bin/clang++")
set(CMAKE_CXX_COMPILER_ARG1 "")
set(CMAKE_CXX_COMPILER_ID "Clang")
set(CMAKE_CXX_COMPILER_VERSION "11.1.0")
set(CMAKE_CXX_COMPILER_VERSION_INTERNAL "")
set(CMAKE_CXX_COMPILER_WRAPPER "")
set(CMAKE_CXX_STANDARD_COMPUTED_DEFAULT "14")
set(CMAKE_CXX_EXTENSIONS_COMPUTED_DEFAULT "ON")
set(CMAKE_CXX_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters;cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates;cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates;cxx_std_17;cxx_std_20")
set(CMAKE_CXX98_COMPILE_FEATURES "cxx_std_98;cxx_template_template_parameters")
set(CMAKE_CXX11_COMPILE_FEATURES "cxx_std_11;cxx_alias_templates;cxx_alignas;cxx_alignof;cxx_attributes;cxx_auto_type;cxx_constexpr;cxx_decltype;cxx_decltype_incomplete_return_types;cxx_default_function_template_args;cxx_defaulted_functions;cxx_defaulted_move_initializers;cxx_delegating_constructors;cxx_deleted_functions;cxx_enum_forward_declarations;cxx_explicit_conversions;cxx_extended_friend_declarations;cxx_extern_templates;cxx_final;cxx_func_identifier;cxx_generalized_initializers;cxx_inheriting_constructors;cxx_inline_namespaces;cxx_lambdas;cxx_local_type_template_args;cxx_long_long_type;cxx_noexcept;cxx_nonstatic_member_init;cxx_nullptr;cxx_override;cxx_range_for;cxx_raw_string_literals;cxx_reference_qualified_functions;cxx_right_angle_brackets;cxx_rvalue_references;cxx_sizeof_member;cxx_static_assert;cxx_strong_enums;cxx_thread_local;cxx_trailing_return_types;cxx_unicode_literals;cxx_uniform_initialization;cxx_unrestricted_unions;cxx_user_literals;cxx_variadic_macros;cxx_variadic_templates")
set(CMAKE_CXX14_COMPILE_FEATURES "cxx_std_14;cxx_aggregate_default_initializers;cxx_attribute_deprecated;cxx_binary_literals;cxx_contextual_conversions;cxx_decltype_auto;cxx_digit_separators;cxx_generic_lambdas;cxx_lambda_init_captures;cxx_relaxed_constexpr;cxx_return_type_deduction;cxx_variable_templates")
set(CMAKE_CXX17_COMPILE_FEATURES "cxx_std_17")
set(CMAKE_CXX20_COMPILE_FEATURES "cxx_std_20")
set(CMAKE_CXX23_COMPILE_FEATURES "")

set(CMAKE_CXX_PLATFORM_ID "Linux")
set(CMAKE_CXX_SIMULATE_ID "")
set(CMAKE_CXX_COMPILER_FRONTEND_VARIANT "GNU")
set(CMAKE_CXX_SIMULATE_VERSION "")




set(CMAKE_AR "/nix/store/mp5s94sca8qyy0sgrz7306b9q8pwdbw1-clang-wrapper-11.1.0/bin/ar")
set(CMAKE_CXX_COMPILER_AR "CMAKE_CXX_COMPILER_AR-NOTFOUND")
set(CMAKE_RANLIB "/nix/store/mp5s94sca8qyy0sgrz7306b9q8pwdbw1-clang-wrapper-11.1.0/bin/ranlib")
set(CMAKE_CXX_COMPILER_RANLIB "CMAKE_CXX_COMPILER_RANLIB-NOTFOUND")
set(CMAKE_LINKER "/nix/store/mp5s94sca8qyy0sgrz7306b9q8pwdbw1-clang-wrapper-11.1.0/bin/ld")
set(CMAKE_MT "")
set(CMAKE_COMPILER_IS_GNUCXX )
set(CMAKE_CXX_COMPILER_LOADED 1)
set(CMAKE_CXX_COMPILER_WORKS TRUE)
set(CMAKE_CXX_ABI_COMPILED TRUE)

set(CMAKE_CXX_COMPILER_ENV_VAR "CXX")

set(CMAKE_CXX_COMPILER_ID_RUN 1)
set(CMAKE_CXX_SOURCE_FILE_EXTENSIONS C;M;c++;cc;cpp;cxx;m;mm;mpp;CPP;ixx;cppm)
set(CMAKE_CXX_IGNORE_EXTENSIONS inl;h;hpp;HPP;H;o;O;obj;OBJ;def;DEF;rc;RC)

foreach (lang C OBJC OBJCXX)
  if (CMAKE_${lang}_COMPILER_ID_RUN)
    foreach(extension IN LISTS CMAKE_${lang}_SOURCE_FILE_EXTENSIONS)
      list(REMOVE_ITEM CMAKE_CXX_SOURCE_FILE_EXTENSIONS ${extension})
    endforeach()
  endif()
endforeach()

set(CMAKE_CXX_LINKER_PREFERENCE 30)
set(CMAKE_CXX_LINKER_PREFERENCE_PROPAGATES 1)

# Save compiler ABI information.
set(CMAKE_CXX_SIZEOF_DATA_PTR "8")
set(CMAKE_CXX_COMPILER_ABI "ELF")
set(CMAKE_CXX_BYTE_ORDER "LITTLE_ENDIAN")
set(CMAKE_CXX_LIBRARY_ARCHITECTURE "")

if(CMAKE_CXX_SIZEOF_DATA_PTR)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_CXX_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_CXX_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_CXX_COMPILER_ABI}")
endif()

if(CMAKE_CXX_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()

set(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX "")
if(CMAKE_CXX_CL_SHOWINCLUDES_PREFIX)
  set(CMAKE_CL_SHOWINCLUDES_PREFIX "${CMAKE_CXX_CL_SHOWINCLUDES_PREFIX}")
endif()





set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES "/nix/store/l119d9k093iv5hf9xfzd0v1n4c6rdr0i-at-spi2-core-2.44.1-dev/include;/nix/store/p0qkri408a3iw8f448hbxqnmiw2v7wry-dbus-1.14.0-dev/include;/nix/store/vasd97zp9z6zczh3pvfpvkgws9352mb2-expat-2.4.8-dev/include;/nix/store/ggwhz4q99p3sw38sz7bd7fwk61b7pslj-glib-2.72.3-dev/include;/nix/store/pff4n2g5spclpmiai531b8dmqscnyvib-zlib-1.2.12-dev/include;/nix/store/jxmc2zhyqgx0j6160fzp4h75ks9q7gyl-libffi-3.4.2-dev/include;/nix/store/5zxflpf41clrajml6ahdjg4z0pylq7pj-gettext-0.21/include;/nix/store/gizfycdnn9pgg0jhw692zanjqr822xn9-glibc-iconv-2.35/include;/nix/store/x7c209rc3qgl68yzj7fv6yv95fxv01w9-dart-2.17.3/include;/nix/store/nlhshd5j3wls7wgl97mn7bmd72nba1dd-gtk+3-3.24.34-dev/include;/nix/store/bxndgh6l53zkds44qiw3ff8l4238ld1b-at-spi2-atk-2.38.0/include;/nix/store/44zachn6vpm2bfk8gxapxgk19s5spsqc-atk-2.38.0-dev/include;/nix/store/klv9kf61cbkqm938l93q837d3nfijdip-cairo-1.16.0-dev/include;/nix/store/gjqc3lxf1yzzzrcpmr5h573xhxlwwncr-fontconfig-2.14.0-dev/include;/nix/store/g6sfb8qzyay57k0z4q5c19z1q8z15ml8-freetype-2.12.1-dev/include;/nix/store/wd1c7q734966mrvynacc6q867h98x0kk-bzip2-1.0.8-dev/include;/nix/store/8gyba5l8m27azjasqx61kx1440cg9cyf-libpng-apng-1.6.37-dev/include;/nix/store/g6mvfv5nh26s4lxa446dh93gmgwvgjns-pixman-0.38.4/include;/nix/store/392pvknw5ia413q4yrnrwn4jlnhmz7dx-libXext-1.3.4-dev/include;/nix/store/dvzlfy3f4ybx5xnzghb6cf46i2cd56z0-xorgproto-2021.5/include;/nix/store/7acawhj1ggis2c4w22pgqsbppv939k3z-libXau-1.0.9-dev/include;/nix/store/8f8c7g6dlhgd0gz1xnwdm5n23d5axiwq-libXrender-0.9.10-dev/include;/nix/store/pwkmvp5hcfnrrg7r659v5jdy4nf7mf2m-libX11-1.7.2-dev/include;/nix/store/rgxhf3hl7yhkrnccbprgf8d05qh57csq-libxcb-1.14-dev/include;/nix/store/l64ifqghmhcwq6hp1mi2gbjd03aj2d7q-xcb-util-0.4.0-dev/include;/nix/store/jiy0q9w3p1iyivpxifvgzmfqpp3205py-libGL-1.4.0-dev/include;/nix/store/0l9mzs2ixklc2sqj2s4cvnqbwsd0a8if-fribidi-1.0.12/include;/nix/store/g4h3arc7f6aax4qy0makag5va4h8nps2-gdk-pixbuf-2.42.8-dev/include;/nix/store/hy27vpk83jja366m7k8h1sqg074f33ch-libtiff-4.4.0-dev/include;/nix/store/ifrbcmymc727hdmnpg2adiraflw5rqnz-libjpeg-turbo-2.1.3-dev/include;/nix/store/ga386q4dha3v13cr96xbx0xvhcfqdrwp-xz-5.2.5-dev/include;/nix/store/qgiwksphgqq2p515z8y8y5dcky2n9nb5-gsettings-desktop-schemas-42.0/include;/nix/store/z8a9ipkigx96q1mhf1a522pyy7zc7wzw-libICE-1.0.10-dev/include;/nix/store/fgj5ajp0cy1z03f4spgr36f3a314i04h-libSM-1.2.3-dev/include;/nix/store/yvxin2y9lqwd81bh5his9z0qbgmx8wlm-libXcomposite-0.4.5-dev/include;/nix/store/1q39i0af6ss8wzx59glpc9pynz1iy0jd-libXfixes-6.0.0-dev/include;/nix/store/wgfxb12h1v2c2j7608sz9llxxxlfjip0-libXcursor-1.2.0-dev/include;/nix/store/i27bhf4wh2nr7p0lwbpli9lsgs44f3y3-libXi-1.8-dev/include;/nix/store/4m18wwvb2z9l9k6ydpzmxr551ph0p5n5-libXrandr-1.5.2-dev/include;/nix/store/67hgr8kiqnplx2cgcw2a4f8jb9apnfbl-pango-1.50.8-dev/include;/nix/store/s30c885qgxc27pxlz0xm3nvi123fz095-harfbuzz-5.0.1-dev/include;/nix/store/ypyvh6lhfjdz30djdk7glcrrj91b0p2z-graphite2-1.3.14/include;/nix/store/hi5jfrc6nizn1s30jp8hc1qwl97g524z-libXft-2.3.4-dev/include;/nix/store/an42rhwn6ck2nix6caikrr4rvizknjhh-wayland-1.21.0-dev/include;/nix/store/wipba59hn9dff71nj0sc48cczgyx15x4-libXinerama-1.1.4-dev/include;/nix/store/nfhx215j2jzs2zvdal5ya37lb5x21l8n-cups-2.4.2-dev/include;/nix/store/ssnb78n81gq6g505d6lf68w8msv72znm-gmp-with-cxx-6.2.1-dev/include;/nix/store/zmdm9v4jjl6hbnc7k7nm263l9ch37n1b-libdatrie-2019-12-20-dev/include;/nix/store/wgnhrgl6bgmrdmkhvwbbh10yhd73hsk3-libepoxy-1.5.10-dev/include;/nix/store/10gkcxpl23bxni1hd8b6i9xlcpqs3b9s-libselinux-3.3-dev/include;/nix/store/48i6wr7x37z8xp7fgwbgawqz4wn045lz-libsepol-3.3-dev/include;/nix/store/42nsacvk02vcva6z7xw6av8qygy680rj-libthai-0.1.29-dev/include;/nix/store/nncrf7wrqh0qycs0q1zh6n7mw910hbka-libxkbcommon-1.4.1-dev/include;/nix/store/g6c7bywd8mgb6yc6h74fqkd7abp8rd5r-pcre-8.45-dev/include;/nix/store/6zw8wy8dnadw8bv7qr97s1q12rarzkm6-util-linux-2.38-dev/include;/nix/store/1mygwc53mbdxsmv6akafm5mm7avkphnd-libXdmcp-1.1.3-dev/include;/nix/store/ykqp454ad7clp1iy4whdijgg5bx0zj29-libXtst-1.2.3/include;/nix/store/7rrznbj0v2hx41gz41az0pflaw0110m4-compiler-rt-libc-11.1.0-dev/include;/nix/store/jdc41bl531bw84wi82y6gvij34q5m24a-gcc-11.3.0/include/c++/11.3.0;/nix/store/jdc41bl531bw84wi82y6gvij34q5m24a-gcc-11.3.0/include/c++/11.3.0/x86_64-unknown-linux-gnu;/nix/store/mp5s94sca8qyy0sgrz7306b9q8pwdbw1-clang-wrapper-11.1.0/resource-root/include;/nix/store/1x86jfiwsp5qi448fcdkkzn7vmx4krv2-glibc-2.35-163-dev/include;/usr/include")
set(CMAKE_CXX_IMPLICIT_LINK_LIBRARIES "stdc++;m;gcc_s;gcc;c;gcc_s;gcc")
set(CMAKE_CXX_IMPLICIT_LINK_DIRECTORIES "/usr/lib;/usr/lib32;/nix/store/15jsqdqf6al7ajf0ig6gw72nhnxzmb3q-expat-2.4.8/lib;/nix/store/halhm59bk4qai52lcsidlpwk4rwsv0w2-dbus-1.14.0-lib/lib;/nix/store/hrn35wrmh3fmql8ak8x3hbfrmc1c614r-zlib-1.2.12/lib;/nix/store/bd7ks1jmqi06h0k4mgws941ck9ivw4dn-libffi-3.4.2/lib;/nix/store/5zxflpf41clrajml6ahdjg4z0pylq7pj-gettext-0.21/lib;/nix/store/hwfw0q5plnqv7qqyz41i9jj9df5p556c-glib-2.72.3/lib;/nix/store/iqy6yzzw4igl8q8n1s670pxhgh54h0m6-at-spi2-core-2.44.1/lib;/nix/store/x7c209rc3qgl68yzj7fv6yv95fxv01w9-dart-2.17.3/lib;/nix/store/bxndgh6l53zkds44qiw3ff8l4238ld1b-at-spi2-atk-2.38.0/lib;/nix/store/3cbq8c9bn0njn55p9hjm66fzgr8pph60-atk-2.38.0/lib;/nix/store/5am0ncybqym7qvdsqhw4kjdarnsnyl2p-bzip2-1.0.8/lib;/nix/store/rw1z00bvbhxa39lxjq8hcijnn9pvjkgw-libpng-apng-1.6.37/lib;/nix/store/si1acldjinbk7l76j50kp8i5bl1mww6m-freetype-2.12.1/lib;/nix/store/ay49pdmzqy6a48xa5zwwrxpbj31nlz00-fontconfig-2.14.0-lib/lib;/nix/store/g6mvfv5nh26s4lxa446dh93gmgwvgjns-pixman-0.38.4/lib;/nix/store/8z7wghr1f48k3h2pi7sac2irkpzvvd0m-libXau-1.0.9/lib;/nix/store/xvlh25n2s9pmlwparry8g30gy2c9afhv-libXext-1.3.4/lib;/nix/store/k4ydfm2cfa3d0wyyagzx8w1ms6759xnq-libxcb-1.14/lib;/nix/store/mgpraiawrf5gijgi2dgi5lhj9954i7vn-libX11-1.7.2/lib;/nix/store/r6nimqmwv2wjb8396g6q1rhivchvcy74-libXrender-0.9.10/lib;/nix/store/g3y8wf4xndydgnc9317qi5dr6zy3ibim-xcb-util-0.4.0/lib;/nix/store/1pj7sjrqhjzzy05yy1pifdvgk9jm552p-libGL-1.4.0/lib;/nix/store/6965sarzbc7gkal5hzaxakms4nyiiz6w-libglvnd-1.4.0/lib;/nix/store/h700gj9x0ban94mjzaaxf3ygblq22mzx-cairo-1.16.0/lib;/nix/store/0l9mzs2ixklc2sqj2s4cvnqbwsd0a8if-fribidi-1.0.12/lib;/nix/store/b4cd5w2r1a85z2p9zvixzsp5b06y76lp-libjpeg-turbo-2.1.3/lib;/nix/store/rivmacrx42wrnx9zavvdzlkk3w6ndfdp-xz-5.2.5/lib;/nix/store/cfxwajwd0xsrrm219wa07w5him5m27ra-libtiff-4.4.0/lib;/nix/store/2aii31mm6wca14c6nn8mbwiac7grwcm5-gdk-pixbuf-2.42.8/lib;/nix/store/snx1kvmnvmavv9fkpb6bq5wii8rfmig8-libICE-1.0.10/lib;/nix/store/81wlhnkvraaqbkh6zwjizvrpsw555pzg-libSM-1.2.3/lib;/nix/store/is47mz1fx08vj7h8pp3isiga8nsgbzsv-libXfixes-6.0.0/lib;/nix/store/3887n1fmqda0spsv2zasbxv3aw7b5llg-libXcomposite-0.4.5/lib;/nix/store/ndnb9x3asvmjgfvh0q2z1n7cian45sr8-libXcursor-1.2.0/lib;/nix/store/qmhqfsdmxbji5scmir9yz46f8a0xm2dw-libXi-1.8/lib;/nix/store/f7libgh4k2rasrl3jx18jdd97n65yns8-libXrandr-1.5.2/lib;/nix/store/ypyvh6lhfjdz30djdk7glcrrj91b0p2z-graphite2-1.3.14/lib;/nix/store/ddk80aww7ykb4zlmhq5dn7l8gn2zfq95-harfbuzz-5.0.1/lib;/nix/store/4ka3ll9fbxfavm0nv8sp9maykk58v4gq-libXft-2.3.4/lib;/nix/store/kw8m8vm5zs6d2krzaa7dz3d79hwfggl3-pango-1.50.8/lib;/nix/store/fnfjyksc87b12kb6cwb1g5l6hqp0aisz-wayland-1.21.0/lib;/nix/store/rxp0pd3bbzhl8klrq8pl4ksjacvpadxr-libXinerama-1.1.4/lib;/nix/store/zn7w4vjbphsi8j39jxjy97wxh19i3xm0-gmp-with-cxx-6.2.1/lib;/nix/store/krgcbgpdph49z027qh5swblxxrm0zz3d-cups-2.4.2-lib/lib;/nix/store/7zcfvib14y1va7707p74sip5drcvpgjl-gtk+3-3.24.34/lib;/nix/store/4f4zrb8668qh5gs0g9wjfn5gsdgr99is-libdatrie-2019-12-20-lib/lib;/nix/store/5pihi9vf49fa7p0ikkca5iia9zywzxcb-libepoxy-1.5.10/lib;/nix/store/rzy6lm45m696iq99kakndddrabv0x3ri-libselinux-3.3/lib;/nix/store/ky9clik3z67ygm11src3wf7hppv2ids0-libsepol-3.3/lib;/nix/store/95jv6hq4f1iyvbdh08q73f7g6d5kbg8x-libthai-0.1.29/lib;/nix/store/v2nakcg7lxxx6ajp98lw4byprg77vvrs-libxkbcommon-1.4.1/lib;/nix/store/j8xiddj86zw4q8pvh466hcd4papcq8dl-pcre-8.45/lib;/nix/store/pk6bfdlqm8ddz6y36jdnfmkjh8xp10zi-util-linux-2.38-lib/lib;/nix/store/lbaz25fqhsbsrpbg53mkkfr8wchv5h1x-libXdmcp-1.1.3/lib;/nix/store/ykqp454ad7clp1iy4whdijgg5bx0zj29-libXtst-1.2.3/lib;/nix/store/6f66prpgx1qx4n6k450sxs3d157ia1ps-glibc-2.35-163/lib;/nix/store/jdc41bl531bw84wi82y6gvij34q5m24a-gcc-11.3.0/lib/gcc/x86_64-unknown-linux-gnu/11.3.0;/nix/store/cs16l9whsq2mgydlg0j4x517z4qr861k-gcc-11.3.0-lib/x86_64-unknown-linux-gnu/lib;/nix/store/r01qnd5sgl8nhs3jcibkn1blzgyl4vga-clang-11.1.0-lib/lib;/nix/store/jdc41bl531bw84wi82y6gvij34q5m24a-gcc-11.3.0/lib64/gcc/x86_64-unknown-linux-gnu/11.3.0;/nix/store/jdc41bl531bw84wi82y6gvij34q5m24a-gcc-11.3.0/lib64;/lib64;/usr/lib64;/lib")
set(CMAKE_CXX_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
