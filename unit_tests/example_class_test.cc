// Copyright (C) 2023 twyleg
#include <gtest/gtest.h>

#include <hello_world/core/example_class.h>

namespace hello_world::Testing {

class ExampleClassTest : public ::testing::Test {

public:

	ExampleClassTest() :
		mExampleClass(42)
	{}

	void SetUp() override {
		// Do stuff
	}

protected:

	hello_world::core::ExampleClass mExampleClass;

};

TEST_F(ExampleClassTest, InitialState_Action_Expectation)
{
	EXPECT_EQ(mExampleClass.getExampleAttribute(), 42);
}

}

