-- language.lua

function n_AddLanguage()
	-- MainFrame
	PX2_LM_EDITOR:AddItem1("n_File", "�ļ�")
	PX2_LM_EDITOR:AddItem1("n_NewProject", "�½�����")
	PX2_LM_EDITOR:AddItem1("n_NewScene", "�½�����")
	PX2_LM_EDITOR:AddItem1("n_Open", "��")
	PX2_LM_EDITOR:AddItem1("n_Save", "����")
	PX2_LM_EDITOR:AddItem1("n_SaveAll", "ȫ������")
	PX2_LM_EDITOR:AddItem1("n_SaveAs", "���Ϊ")
	PX2_LM_EDITOR:AddItem1("n_Close", "�ر�")
	PX2_LM_EDITOR:AddItem1("n_Exit", "�˳�")
	PX2_LM_EDITOR:AddItem1("n_Edit", "�༭")
	PX2_LM_EDITOR:AddItem1("n_View", "��ͼ")
	
	PX2_LM_EDITOR:AddItem1("n_Edit", "�༭")
	PX2_LM_EDITOR:AddItem1("n_UnDo", "����")
	PX2_LM_EDITOR:AddItem1("n_ReDo", "�ظ�")
	PX2_LM_EDITOR:AddItem1("n_Copy", "����")
	PX2_LM_EDITOR:AddItem1("n_Paste", "ճ��")
	PX2_LM_EDITOR:AddItem1("n_Clone", "��¡")
	PX2_LM_EDITOR:AddItem1("n_Delete", "ɾ��")
	PX2_LM_EDITOR:AddItem1("n_DeleteAll", "ɾ������")
	PX2_LM_EDITOR:AddItem1("n_Import", "����")
	PX2_LM_EDITOR:AddItem1("n_Export", "����")
	PX2_LM_EDITOR:AddItem1("n_Select", "ѡ��")
	PX2_LM_EDITOR:AddItem1("n_Translate", "λ��")
	PX2_LM_EDITOR:AddItem1("n_Rotate", "��ת")
	PX2_LM_EDITOR:AddItem1("n_Scale", "����")
	PX2_LM_EDITOR:AddItem1("n_PlayAndStop", "����/ֹͣ")
	PX2_LM_EDITOR:AddItem1("n_ResetPlay", "���ò���")
	
	PX2_LM_EDITOR:AddItem1("n_Local", "����")
	PX2_LM_EDITOR:AddItem1("n_World", "����")
	PX2_LM_EDITOR:AddItem1("n_Parent", "������")
	
	PX2_LM_EDITOR:AddItem1("n_Window", "����")
	PX2_LM_EDITOR:AddItem1("n_Project", "����")
	PX2_LM_EDITOR:AddItem1("n_Stage", "�༭")
	PX2_LM_EDITOR:AddItem1("n_Res", "��Դ")
	PX2_LM_EDITOR:AddItem1("n_Inspector", "����")
	PX2_LM_EDITOR:AddItem1("n_Console", "����̨")
	PX2_LM_EDITOR:AddItem1("n_Text", "�ı�")
	PX2_LM_EDITOR:AddItem1("n_Connect", "����")
	PX2_LM_EDITOR:AddItem1("n_PreView", "Ԥ��")
	PX2_LM_EDITOR:AddItem1("n_Logic", "�߼�")
	PX2_LM_EDITOR:AddItem1("n_Play0", "����")
	PX2_LM_EDITOR:AddItem1("n_TimeLine", "ʱ����")
	
	PX2_LM_EDITOR:AddItem1("n_Welcome", "��ӭ!")
	
	PX2_LM_EDITOR:AddItem1("n_Debug", "����")
	
	PX2_LM_EDITOR:AddItem1("n_Tool", "����")
	
	PX2_LM_EDITOR:AddItem1("n_Help", "����")	
	PX2_LM_EDITOR:AddItem1("n_About", "����")
	
	-- General
	PX2_LM_EDITOR:AddItem1("n_Create", "����")
	
	-- Connect
	PX2_LM_EDITOR:AddItem1("n_Name", "����")
	PX2_LM_EDITOR:AddItem1("n_IP", "IP")
	PX2_LM_EDITOR:AddItem1("n_State", "״̬")
	PX2_LM_EDITOR:AddItem1("n_Property", "����")
	
	-- BluePrint
	PX2_LM_EDITOR:AddItem1("n_BluePrint", "��ͼ")
	PX2_LM_EDITOR:AddItem1("n_Compile", "����")
	PX2_LM_EDITOR:AddItem1("n_Disconnect", "�Ͽ�")
	
	PX2_LM_EDITOR:AddItem1("n_Play0", "����")
	
	-- Scene
	PX2_LM_EDITOR:AddItem1("n_Scene", "����")
	
	-- UI
	PX2_LM_EDITOR:AddItem1("n_UI", "����")
	PX2_LM_EDITOR:AddItem1("n_UIFrame", "��")
	PX2_LM_EDITOR:AddItem1("n_UIFPicBox", "��ͼƬ")
	PX2_LM_EDITOR:AddItem1("n_UIFText", "���ı�")
	PX2_LM_EDITOR:AddItem1("n_UIButton", "��ť")
	PX2_LM_EDITOR:AddItem1("n_UICheckButton", "ѡ��ť")
	PX2_LM_EDITOR:AddItem1("n_UIComboBox", "��Ͽ�")
	PX2_LM_EDITOR:AddItem1("n_UIEditBox", "�༭��")
	PX2_LM_EDITOR:AddItem1("n_UIPicBox", "ͼƬ")
	PX2_LM_EDITOR:AddItem1("n_UIText", "�ı�")	
	
	PX2_LM_EDITOR:AddItem1("n_CreateScriptControllerFromRes", "����Դ�����ű�������")
	
	PX2_LM_EDITOR:AddItem1("n_CreateFromRes", "����Դ����")
	
	-- Event
	PX2_LM_EDITOR:AddItem1("n_Event", "�¼�")
	PX2_LM_EDITOR:AddItem1("n_SimuStart", "���濪ʼ")
	
	-- Edit
	PX2_LM_EDITOR:AddItem1("n_Geometry", "������")
	PX2_LM_EDITOR:AddItem1("n_Plane", "ƽ��")
	PX2_LM_EDITOR:AddItem1("n_Box", "������")
	PX2_LM_EDITOR:AddItem1("n_Sphere", "��")
	PX2_LM_EDITOR:AddItem1("n_Camera", "���")
	PX2_LM_EDITOR:AddItem1("n_Light", "�ƹ�")
	PX2_LM_EDITOR:AddItem1("n_Trigger", "������")
	PX2_LM_EDITOR:AddItem1("n_Terrain", "����")
	PX2_LM_EDITOR:AddItem1("n_Sky", "���")
	PX2_LM_EDITOR:AddItem1("n_ImportSelectedRes", "����ѡ����Դ")
	PX2_LM_EDITOR:AddItem1("n_Import", "����")
	PX2_LM_EDITOR:AddItem1("n_Export", "����")
	PX2_LM_EDITOR:AddItem1("n_SceneActor", "������ɫ")
	PX2_LM_EDITOR:AddItem1("n_Effect", "��Ч")
	PX2_LM_EDITOR:AddItem1("n_Billboard", "�����")
	PX2_LM_EDITOR:AddItem1("n_Particle", "����")
	PX2_LM_EDITOR:AddItem1("n_Beam", "����")
	PX2_LM_EDITOR:AddItem1("n_Ribbon", "����")
	PX2_LM_EDITOR:AddItem1("n_Sound", "����")
	PX2_LM_EDITOR:AddItem1("n_Actor", "��ɫ")
	PX2_LM_EDITOR:AddItem1("n_InfinitePlane", "����ƽ��")
	
	PX2_LM_EDITOR:AddItem1("n_Node", "�ڵ�")
	PX2_LM_EDITOR:AddItem1("n_SkyBox", "��պ�")
	PX2_LM_EDITOR:AddItem1("n_Controller", "������")
	PX2_LM_EDITOR:AddItem1("n_ColorController", "��ɫ������")
	PX2_LM_EDITOR:AddItem1("n_BrightnessController", "���ȿ�����")
	PX2_LM_EDITOR:AddItem1("n_AlphaController", "͸��������")
	PX2_LM_EDITOR:AddItem1("n_UniformScaleController", "ͳһ���ſ�����")
	PX2_LM_EDITOR:AddItem1("n_ScaleController", "���ſ�����")
	PX2_LM_EDITOR:AddItem1("n_RotateController", "��ת������")
	PX2_LM_EDITOR:AddItem1("n_TranslateController", "λ�ƿ�����")		
	PX2_LM_EDITOR:AddItem1("n_ScriptController", "�ű�������")
	PX2_LM_EDITOR:AddItem1("n_EffectMoudle", "��Чģ��")
	
	PX2_LM_EDITOR:AddItem1("n_Copy", "����")
	PX2_LM_EDITOR:AddItem1("n_Paste", "ճ��")
	PX2_LM_EDITOR:AddItem1("n_Delete", "ɾ��")
	PX2_LM_EDITOR:AddItem1("n_DeleteAll", "ɾ��ȫ��")
	
	PX2_LM_EDITOR:AddItem1("n_ResetPlay", "���ò���")
	PX2_LM_EDITOR:AddItem1("n_Play", "����")
	PX2_LM_EDITOR:AddItem1("n_Pause", "��ͣ")
	PX2_LM_EDITOR:AddItem1("n_Reset", "����")
	
	PX2_LM_EDITOR:AddItem1("n_FindInProjectTree", "�ڹ������в���")
	PX2_LM_EDITOR:AddItem1("n_FindInResTree", "����Դ���в���")
	
	PX2_LM_EDITOR:AddItem1("n_MakeCurve", "���߻�")
	
	-- timeline
	PX2_LM_EDITOR:AddItem1("n_SetInValue", "����InVal")
	PX2_LM_EDITOR:AddItem1("n_NewInValue", "��InVal")
	PX2_LM_EDITOR:AddItem1("n_SetOutValue", "����OutVal")
	PX2_LM_EDITOR:AddItem1("n_NewOutValue", "��OutVal")
	PX2_LM_EDITOR:AddItem1("n_AddPoint", "���ӵ�")
	PX2_LM_EDITOR:AddItem1("n_DeletePoint", "ɾ��")	
	
	-- tips
	PX2_LM_EDITOR:AddItem("n_Notice", "ע�⣡", "Notice!")
	PX2_LM_EDITOR:AddItem("n_Tip0", "�˳���", "Do you want to exist?")
	PX2_LM_EDITOR:AddItem("n_TipCreateProject", "�����Ѿ����ڣ��޷�������", "Project is already exist, can't be created!")
	PX2_LM_EDITOR:AddItem("n_TipNotHasParent", "������ڸ��ڵ㣡", "There must has a parent node!")
	PX2_LM_EDITOR:AddItem("n_TipNotSelectAObject", "����ѡ��һ������", "You must select a object!")
	PX2_LM_EDITOR:AddItem("n_OpenProject", "����Ŀ", "Open Project")
	PX2_LM_EDITOR:AddItem("n_OpenScene", "�򿪳���", "Open Scene")
	PX2_LM_EDITOR:AddItem("n_SaveScene", "���泡��", "Save Scene")
	PX2_LM_EDITOR:AddItem("n_SaveSceneAs", "�������Ϊ", "Save Scene as")
	PX2_LM_EDITOR:AddItem("n_Open", "��", "Open")
	PX2_LM_EDITOR:AddItem("n_CopyResPath", "����·��", "CopyResPath")
	PX2_LM_EDITOR:AddItem("n_About", "����", "About..")
end