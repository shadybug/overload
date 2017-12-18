#ifndef CENTERCONTAINER_H
#define CENTERCONTAINER_H

#if defined(_WIN32) && defined(_GD_CPP_BINDING_IMPL)
#  define GD_CPP_BINDING_API __declspec(dllexport)
#elif defined(_WIN32)
#  define GD_CPP_BINDING_API __declspec(dllimport)
#else
#  define GD_CPP_BINDING_API
#endif


#include "core/CoreTypes.hpp"

#include <godot.h>



#include "Container.hpp"


namespace godot {



class GD_CPP_BINDING_API CenterContainer : public Container {
public:

	void _init();



	void set_use_top_left(const bool enable);
	bool is_using_top_left() const;
};

}
#endif
