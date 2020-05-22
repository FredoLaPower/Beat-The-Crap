extends Node

const GRAVITY: int = 1000
const MOTION_ACCELERATION: float = 0.2
const MOTION_DECELERATION: float = 0.1
const DIAGONAL_MOTION_FACTOR: float = 0.71 # Roughly sqrt(2)

const PROJET_NAME: String = "Fat & Furious"
const BUILT_VERSION: String = "v1.0 prototype"

enum DAMAGE_TYPE {Physical, Fire, Acid, Electric, Gun, Rifle, Blunt, Sharp}
