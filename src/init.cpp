#include <Godot.hpp>
#include <CanvasModulate.hpp>

using namespace godot;

int light = 24;
int motion = 25;
int sound = 26;

class Canvas : public CanvasModulate {
	GODOT_CLASS(Canvas, CanvasModulate);
	
public:
	Canvas(){}

	void _process(float delta){
		Godot::print(light);
	}	
		
	static void _register_methods(){
		register_method("_process", &CanvasModulate::_process);
	}
};

GODOT_NATIVE_INIT(godot_native_init_options *options){
	register_class<Canvas>();
}
