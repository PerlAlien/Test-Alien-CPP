# Test::Alien::CPP ![linux](https://github.com/PerlAlien/Test-Alien-CPP/workflows/linux/badge.svg)

Testing tools for Alien modules for projects that use C++

# SYNOPSIS

```perl
use Test2::V0;
use Test::Alien::CPP;
use Alien::libmycpplib;

alien_ok 'ALien::libmycpplib';
my $xs = do { local $/; <DATA> };
xs_ok $xs, with_subtest {
  my($module) = @_;
  ok $module->version;
};

done_testing;

__DATA__

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include <mycpplib.h>

MODULE = TA_MODULE PACKAGE = TA_MODULE

const char *
version(klass)
    const char *klass
  CODE:
    RETVAL = MyCppLib->version;
  OUTPUT:
    RETVAL
```

# DESCRIPTION

This module works exactly like [Test::Alien](https://metacpan.org/pod/Test::Alien) except that it supports C++.  All
functions like `alien_ok`, etc that are exported by [Test::Alien](https://metacpan.org/pod/Test::Alien) are exported
by this module.  The only difference is that `xs_ok` injects C++ support before
delegating to [Test::Alien](https://metacpan.org/pod/Test::Alien).

# FUNCTIONS

## xs\_ok

```
xs_ok $xs;
xs_ok $xs, $message;
```

Compiles, links the given `XS` / C++ code and attaches to Perl.
See [Test::Alien](https://metacpan.org/pod/Test::Alien) for further details on how this test works.

# SEE ALSO

- [Test::Alien](https://metacpan.org/pod/Test::Alien)
- [Test::Alien::CanCompileCpp](https://metacpan.org/pod/Test::Alien::CanCompileCpp)

# AUTHOR

Author: Graham Ollis <plicease@cpan.org>

Contributors:

Roy Storey (KIWIROY)

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017-2022 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
