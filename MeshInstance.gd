extends MeshInstance

var arr = []


var uvs = PoolVector2Array()
var normals = PoolVector3Array()

var size = 5

var z = 0
var sq_points = []

var anicount = 0

func _ready():
    arr.resize(Mesh.ARRAY_MAX)
    
    for i in range(size):
        for j in range(size):
            sq_points.append(Vector3(i,j,z))
            
    
    
    # arr[Mesh.ARRAY_VERTEX] = verts
    # arr[Mesh.ARRAY_TEX_UV] = uvs
    # arr[Mesh.ARRAY_NORMAL] = normals
    # arr[Mesh.ARRAY_INDEX] = indices
        
    # mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)


func _process(delta):
    mesh.clear_surfaces()
    
    var verts = PoolVector3Array()
    var indices = PoolIntArray()
    
    var points = []
    
    anicount += delta
    
    # for i in range(len(sq_points)):
    #     sq_points[i] = sq_points[i] + Vector3(10 * delta,0,0)
    for n in range(pow(size, 2)):
        points.append(sq_points[n] + Vector3(0,0,sin( anicount*10 + int(n % size) * 3 ) * 0.5))
    
    print(anicount)
        
    var counter = 0
    for i in range(size-1):
        for j in range(size-1):
            # First triangle
            verts.append(points[size*i + j])
            indices.append(counter)
            counter += 1
            
            verts.append(points[size*(i+1) + j])
            indices.append(counter)
            counter += 1
        
            verts.append(points[size*i + j+1])
            indices.append(counter)
            counter += 1
         
            # Second Triangle
            verts.append(points[size*(i+1) + j+1])
            indices.append(counter)
            counter += 1
            
            verts.append(points[size*i + j+1])
            indices.append(counter)
            counter += 1
        
            verts.append(points[size*(i+1) + j])
            indices.append(counter)
            counter += 1
            
    arr[Mesh.ARRAY_VERTEX] = verts
    # arr[Mesh.ARRAY_TEX_UV] = uvs
    # arr[Mesh.ARRAY_NORMAL] = normals
    arr[Mesh.ARRAY_INDEX] = indices
        
    mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)

func waves(n, d):
    pass
