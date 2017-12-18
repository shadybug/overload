#ifndef CIRCLESHAPE2D_H
#define CIRCLESHAPE2D_H

#if defined(_WIN32) && defined(_GD_CPP_BINDING_IMPL)
#  define GD_CPP_BINDING_API __declspec(dllexport)
#elif defined(_WIN32)
#  define GD_CPP_BINDING_API __declspec(dllimport)
#else
#  define GD_CPP_BINDING_API
#endif


#include "core/CoreTypes.hpp"

#include <godot.h>



#include "Shape2D.hpp"


namespace godot {



class GD_CPP_BINDING_API CircleShape2D : public Shape2D {
public:

	void _init();



	void set_radius(const float radius);
	float get_radius() const;
};

}
#endif
