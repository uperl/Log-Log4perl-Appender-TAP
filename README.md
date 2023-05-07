# Log::Log4perl::Appender::TAP ![linux](https://github.com/uperl/Log-Log4perl-Appender-TAP/workflows/linux/badge.svg) ![macos](https://github.com/uperl/Log-Log4perl-Appender-TAP/workflows/macos/badge.svg) ![windows](https://github.com/uperl/Log-Log4perl-Appender-TAP/workflows/windows/badge.svg) ![msys2-mingw](https://github.com/uperl/Log-Log4perl-Appender-TAP/workflows/msys2-mingw/badge.svg)

Append to TAP output

# SYNOPSIS

```perl
use Test2::V0;
use Log::Log4perl;

LOG::Log4perl::init(\<<CONF);
log4perl.rootLogger=ERROR, TAP
log4perl.appender.TAP=Log::Log4perl::Appender::TAP
log4perl.appender.TAP.method=diag
log4perl.appender.TAP=layout=PatternLayout
log4perl.appender.TAP=layout.ConversionPattern="[%rms] %m%n"
CONF

DEBUG "this message doesn't see the light of day";
ERROR "This gets logged to TAP using diag";
```

# DESCRIPTION

This very simple [Log::Log4perl](https://metacpan.org/pod/Log::Log4perl) appender sends log output via [Test2::API](https://metacpan.org/pod/Test2::API) to TAP
(or any other format supported by [Test2::API](https://metacpan.org/pod/Test2::API)).  It also works with
[Test::Builder](https://metacpan.org/pod/Test::Builder) and [Test::More](https://metacpan.org/pod/Test::More) so long as you have [Test2::API](https://metacpan.org/pod/Test2::API)
installed.  It only takes one special argument, the method, which can
be either `diag` or `note`.

# SEE ALSO

- [Log::Log4perl](https://metacpan.org/pod/Log::Log4perl)

    Main module documentation for `Log4perl`.

- [Log::Dispatch::TAP](https://metacpan.org/pod/Log::Dispatch::TAP)

    Similar module but for [Log::Dispatch](https://metacpan.org/pod/Log::Dispatch) instead of `Log4perl`.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017-2022 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
