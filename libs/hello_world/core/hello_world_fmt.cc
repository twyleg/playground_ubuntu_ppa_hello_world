// Copyright (C) 2024 twyleg
#include "hello_world.h"

#include <fmt/core.h>

namespace hello_world::core::fmt {

void hello_world() {
	::fmt::print("Hello World {}!\n\r", __cplusplus);
}

}
