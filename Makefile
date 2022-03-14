include Makefile.inc

acdrag.intfb.ok: acdrag.intfb.h model_physics_mf_mod.o parkind1.o yomhook.o yomcst.o
	touch acdrag.intfb.ok

acdrag.o: acdrag.F90 model_physics_mf_mod.o parkind1.o yomhook.o yomcst.o
	$(FC) -c acdrag.F90

eint_mod.o: eint_mod.F90 parkind1.o
	$(FC) -c eint_mod.F90

getdata_mod.o: getdata_mod.F90 parkind1.o
	$(FC) -c getdata_mod.F90

load_model_physics_mf_type_mod.o: load_model_physics_mf_type_mod.F90 model_physics_mf_mod.o load_sl_struct_mod.o load_tarphy_mod.o load_tcvmnh_mod.o load_tlouis_mod.o load_tmse_mod.o load_tnorgwd_mod.o load_tparar_mod.o load_tphy_mod.o load_tphy0_mod.o load_tphy1_mod.o load_tphy2_mod.o load_tphy3_mod.o load_tphyds_mod.o load_tsimphl_mod.o load_ttoph_mod.o load_tvdoz_mod.o
	$(FC) -c load_model_physics_mf_type_mod.F90

load_sl_struct_mod.o: load_sl_struct_mod.F90 eint_mod.o
	$(FC) -c load_sl_struct_mod.F90

load_tarphy_mod.o: load_tarphy_mod.F90 yomarphy.o
	$(FC) -c load_tarphy_mod.F90

load_tcst_mod.o: load_tcst_mod.F90 yomcst.o
	$(FC) -c load_tcst_mod.F90

load_tcvmnh_mod.o: load_tcvmnh_mod.F90 yomcvmnh.o
	$(FC) -c load_tcvmnh_mod.F90

load_tdprecips_mod.o: load_tdprecips_mod.F90 yomdprecips.o
	$(FC) -c load_tdprecips_mod.F90

load_tdvisi_mod.o: load_tdvisi_mod.F90 yomdvisi.o
	$(FC) -c load_tdvisi_mod.F90

load_tlouis_mod.o: load_tlouis_mod.F90 yomlouis.o
	$(FC) -c load_tlouis_mod.F90

load_tmse_mod.o: load_tmse_mod.F90 yommse.o
	$(FC) -c load_tmse_mod.F90

load_tnorgwd_mod.o: load_tnorgwd_mod.F90 yomnorgwd.o
	$(FC) -c load_tnorgwd_mod.F90

load_tparar_mod.o: load_tparar_mod.F90 yomparar.o
	$(FC) -c load_tparar_mod.F90

load_tphy0_mod.o: load_tphy0_mod.F90 yomphy0.o
	$(FC) -c load_tphy0_mod.F90

load_tphy1_mod.o: load_tphy1_mod.F90 yomphy1.o
	$(FC) -c load_tphy1_mod.F90

load_tphy2_mod.o: load_tphy2_mod.F90 yomphy2.o
	$(FC) -c load_tphy2_mod.F90

load_tphy3_mod.o: load_tphy3_mod.F90 yomphy3.o
	$(FC) -c load_tphy3_mod.F90

load_tphy_mod.o: load_tphy_mod.F90 yomphy.o load_tdprecips_mod.o load_tdvisi_mod.o
	$(FC) -c load_tphy_mod.F90

load_tphyds_mod.o: load_tphyds_mod.F90 yomphyds.o
	$(FC) -c load_tphyds_mod.F90

load_tsimphl_mod.o: load_tsimphl_mod.F90 yomsimphl.o
	$(FC) -c load_tsimphl_mod.F90

load_tsta_mod.o: load_tsta_mod.F90 yomsta.o
	$(FC) -c load_tsta_mod.F90

load_ttoph_mod.o: load_ttoph_mod.F90 yomtoph.o
	$(FC) -c load_ttoph_mod.F90

load_tvdoz_mod.o: load_tvdoz_mod.F90 yomvdoz.o
	$(FC) -c load_tvdoz_mod.F90

model_physics_mf_mod.o: model_physics_mf_mod.F90 yomphy.o yomphy0.o yomphy1.o yomphy2.o yomphy3.o yomphyds.o yomcvmnh.o yomtoph.o yomvdoz.o yomsimphl.o yomarphy.o yomparar.o yommse.o yomlouis.o yomnorgwd.o eint_mod.o parkind1.o
	$(FC) -c model_physics_mf_mod.F90

parkind1.o: parkind1.F90 
	$(FC) -c parkind1.F90

wrap_acdrag.o: wrap_acdrag.F90 model_physics_mf_mod.o parkind1.o yomcst.o load_tcst_mod.o load_model_physics_mf_type_mod.o getdata_mod.o xrd_getoptions.o acdrag.intfb.ok
	$(FC) -c wrap_acdrag.F90

xrd_getoptions.o: xrd_getoptions.F90 parkind1.o xrd_unix_env.o
	$(FC) -c xrd_getoptions.F90

xrd_unix_env.o: xrd_unix_env.F90 parkind1.o
	$(FC) -c xrd_unix_env.F90

yomarphy.o: yomarphy.F90 parkind1.o
	$(FC) -c yomarphy.F90

yomcst.o: yomcst.F90 parkind1.o
	$(FC) -c yomcst.F90

yomcvmnh.o: yomcvmnh.F90 parkind1.o
	$(FC) -c yomcvmnh.F90

yomdprecips.o: yomdprecips.F90 parkind1.o
	$(FC) -c yomdprecips.F90

yomdvisi.o: yomdvisi.F90 parkind1.o
	$(FC) -c yomdvisi.F90

yomhook.o: yomhook.F90 parkind1.o
	$(FC) -c yomhook.F90

yomlouis.o: yomlouis.F90 parkind1.o
	$(FC) -c yomlouis.F90

yommse.o: yommse.F90 parkind1.o
	$(FC) -c yommse.F90

yomnorgwd.o: yomnorgwd.F90 parkind1.o
	$(FC) -c yomnorgwd.F90

yomparar.o: yomparar.F90 parkind1.o
	$(FC) -c yomparar.F90

yomphy.o: yomphy.F90 parkind1.o yomdprecips.o yomdvisi.o
	$(FC) -c yomphy.F90

yomphy0.o: yomphy0.F90 parkind1.o
	$(FC) -c yomphy0.F90

yomphy1.o: yomphy1.F90 parkind1.o
	$(FC) -c yomphy1.F90

yomphy2.o: yomphy2.F90 parkind1.o
	$(FC) -c yomphy2.F90

yomphy3.o: yomphy3.F90 parkind1.o
	$(FC) -c yomphy3.F90

yomphyds.o: yomphyds.F90 parkind1.o
	$(FC) -c yomphyds.F90

yomsimphl.o: yomsimphl.F90 parkind1.o
	$(FC) -c yomsimphl.F90

yomsta.o: yomsta.F90 parkind1.o
	$(FC) -c yomsta.F90

yomtoph.o: yomtoph.F90 parkind1.o
	$(FC) -c yomtoph.F90

yomvdoz.o: yomvdoz.F90 parkind1.o
	$(FC) -c yomvdoz.F90

wrap_acdrag.x: wrap_acdrag.o acdrag.o eint_mod.o getdata_mod.o load_model_physics_mf_type_mod.o load_sl_struct_mod.o load_tarphy_mod.o load_tcst_mod.o load_tcvmnh_mod.o load_tdprecips_mod.o load_tdvisi_mod.o load_tlouis_mod.o load_tmse_mod.o load_tnorgwd_mod.o load_tparar_mod.o load_tphy0_mod.o load_tphy1_mod.o load_tphy2_mod.o load_tphy3_mod.o load_tphy_mod.o load_tphyds_mod.o load_tsimphl_mod.o load_tsta_mod.o load_ttoph_mod.o load_tvdoz_mod.o model_physics_mf_mod.o parkind1.o xrd_getoptions.o xrd_unix_env.o yomarphy.o yomcst.o yomcvmnh.o yomdprecips.o yomdvisi.o yomhook.o yomlouis.o yommse.o yomnorgwd.o yomparar.o yomphy.o yomphy0.o yomphy1.o yomphy2.o yomphy3.o yomphyds.o yomsimphl.o yomsta.o yomtoph.o yomvdoz.o
	$(FC) -o wrap_acdrag.x wrap_acdrag.o acdrag.o eint_mod.o getdata_mod.o load_model_physics_mf_type_mod.o load_sl_struct_mod.o load_tarphy_mod.o load_tcst_mod.o load_tcvmnh_mod.o load_tdprecips_mod.o load_tdvisi_mod.o load_tlouis_mod.o load_tmse_mod.o load_tnorgwd_mod.o load_tparar_mod.o load_tphy0_mod.o load_tphy1_mod.o load_tphy2_mod.o load_tphy3_mod.o load_tphy_mod.o load_tphyds_mod.o load_tsimphl_mod.o load_tsta_mod.o load_ttoph_mod.o load_tvdoz_mod.o model_physics_mf_mod.o parkind1.o xrd_getoptions.o xrd_unix_env.o yomarphy.o yomcst.o yomcvmnh.o yomdprecips.o yomdvisi.o yomhook.o yomlouis.o yommse.o yomnorgwd.o yomparar.o yomphy.o yomphy0.o yomphy1.o yomphy2.o yomphy3.o yomphyds.o yomsimphl.o yomsta.o yomtoph.o yomvdoz.o $(LIBS)


subclean:
	\rm -f acdrag.o wrap_acdrag.o

clean:
	\rm -f *.o *.xml *.a *.x *.mod *.optrpt

tidy:
	\rm -f *.xml *.optrpt
