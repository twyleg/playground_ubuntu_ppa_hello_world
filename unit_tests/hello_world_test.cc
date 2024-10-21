// Copyright (C) 2024 twyleg
#include <gtest/gtest.h>

#include <hello_world/core/hello_world.h>

namespace hello_world::Testing {

class HelloWorldTest : public ::testing::Test {

public:

	HelloWorldTest()
	{}

	void SetUp() override {
		// Do stuff
	}

protected:


};

TEST_F(HelloWorldTest, InitialState_Action_Expectation)
{
	EXPECT_TRUE(true);
}

}

