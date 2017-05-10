︠8f77989d-bb4d-48f6-b9a9-8725ede2631ds︠
import numpy as np

def spectral_plot_2d(G,v_size=20):
    vertices = G.vertices()
    L = G.kirchhoff_matrix()
    eigvals, eigvecs = np.linalg.eigh(L)
    v1 = eigvecs[:,1]
    v2 = eigvecs[:,2]
    G.set_pos({vertices[i]: [v1[i], v2[i]] for i in range(len(vertices))})
    return G.plot(edge_color = "blue",edge_thickness = .8, vertex_color="blue", vertex_size = v_size, vertex_labels=False)

def spectral_plot_3d(G,v_size=0.01,e_size=0.003,e_size2=0.01):
    vertices = G.vertices()
    L = G.kirchhoff_matrix()
    eigvals, eigvecs = np.linalg.eigh(L)
    v1 = eigvecs[:,1]
    v2 = eigvecs[:,2]
    v3 = eigvecs[:,3]
    l = {vertices[i]: [v1[i], v2[i], v3[i]] for i in range(len(vertices))}
    return G.plot3d(vertex_size=v_size, edge_size=e_size, edge_size2=e_size2, vertex_colors={(1,1,1):G.vertices()}, color_by_label=True,pos3d=l, scale=2.0)
︡f5d2b322-bb04-4aa1-86ee-7caa60fce6a8︡{"done":true}︡
︠cbe4da7b-ba69-4308-8898-4820e3e6d8ces︠
G = graphs.BuckyBall()
spectral_plot_2d(G).show()
spectral_plot_3d(G).show()
︡479528bd-a499-4621-9ebb-498a0517e116︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_moXdnn.svg","show":true,"text":null,"uuid":"3d317aca-654c-4037-813f-7293ceebf0e4"},"once":false}︡{"file":{"filename":"d35ccde3-b926-4754-80fc-eaccff7a5b38.sage3d","uuid":"d35ccde3-b926-4754-80fc-eaccff7a5b38"}}︡{"done":true}︡
︠4b323d72-4bff-42d7-a0c6-ab4a0de1911as︠
for i in [2,3,4,5,6]:
    G = graphs.SierpinskiGasketGraph(i)
    spectral_plot_2d(G,v_size=3).show()
︡f0314a64-0a75-49d0-bc2e-c8c1d40f461d︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_oYzYvv.svg","show":true,"text":null,"uuid":"4d80702d-5790-4042-9fbd-ca0484096ad5"},"once":false}︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_fgnn4o.svg","show":true,"text":null,"uuid":"4321303b-5d01-4f33-848e-fdbddfc2a875"},"once":false}︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_Q4Y9fY.svg","show":true,"text":null,"uuid":"cf30c01d-eb1d-479e-9975-b5bb39068f58"},"once":false}︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_klR2nZ.svg","show":true,"text":null,"uuid":"41e5214c-425b-495b-b690-8044a06206e4"},"once":false}︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_e7qUxk.svg","show":true,"text":null,"uuid":"ce4ab9d1-e274-4111-8b50-2379946b8ca5"},"once":false}︡{"done":true}︡
︠95e4dc79-1975-406f-9ed2-fd1e8327abc0s︠
G = graphs.MycielskiGraph(4)
spectral_plot_2d(G).show()
G = graphs.MycielskiGraph(5)
spectral_plot_3d(G).show()
︡bf8b0755-96e6-4b1e-8e99-ff0c6d99d18e︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_dlYQJN.svg","show":true,"text":null,"uuid":"4b70aa8d-f58f-4b75-b9db-f57bf1c24854"},"once":false}︡{"file":{"filename":"e332504c-d8eb-4926-ad9c-74811788fb6f.sage3d","uuid":"e332504c-d8eb-4926-ad9c-74811788fb6f"}}︡{"done":true}︡
︠277f7488-831b-4918-9254-99541d5cd1b2s︠
for i in [4,5,15]:
    G = graphs.ToroidalGrid2dGraph(i, i)
    G.plot(edge_color = "blue",edge_thickness = .8, vertex_color="blue", vertex_size = 20, vertex_labels=False)
    spectral_plot_2d(G).show()
    spectral_plot_3d(G,v_size=0.003,e_size=0.0015).show()
︡0f6d9a5a-03c5-496d-a3a1-98e9eaba0459︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_RBQnel.svg","show":true,"text":null,"uuid":"af6051b5-e867-4489-9cfc-ce0b54c50b2c"},"once":false}︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_8t4v9S.svg","show":true,"text":null,"uuid":"3ee13ce1-b08b-474d-a457-316239e3deec"},"once":false}︡{"file":{"filename":"d61e2245-fe05-4f23-9982-a65cf4f75c14.sage3d","uuid":"d61e2245-fe05-4f23-9982-a65cf4f75c14"}}︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_5Yc_VK.svg","show":true,"text":null,"uuid":"105ddd33-0b03-4f9b-b699-1e89cfba6ca1"},"once":false}︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_VZUmDc.svg","show":true,"text":null,"uuid":"8f2475a7-0436-4356-890f-90e4c7b92ef2"},"once":false}︡{"file":{"filename":"f9bdf3e8-1758-4500-8333-666e1a76c5ae.sage3d","uuid":"f9bdf3e8-1758-4500-8333-666e1a76c5ae"}}︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_XHPZkz.svg","show":true,"text":null,"uuid":"02cf181b-3b9a-43fa-b2c2-a1c52565939c"},"once":false}︡{"file":{"filename":"/projects/e45ac699-fb28-448e-b028-64e92b88e0fa/.sage/temp/compute0-us/14280/tmp_Kr14UX.svg","show":true,"text":null,"uuid":"e9b0e866-d75d-4965-850c-fe9b4b5b3df3"},"once":false}︡{"file":{"filename":"04eb1b0f-7168-449e-b168-516e15a57c74.sage3d","uuid":"04eb1b0f-7168-449e-b168-516e15a57c74"}}︡{"done":true}︡
︠a55ecbc8-d7f4-4f1a-b3e0-b6205285e173︠









