module "rg-mod" {
  source = "../RG"
  varrg  = var.versionrg
}

module "sa-mod" {
  source     = "../SA"
  varsa      = var.versionsa
  depends_on = [module.rg-mod]
}

module "vn-mod" {
  source     = "../VN"
  varvn      = var.versionvn
  depends_on = [module.rg-mod]

}

module "sn-mod" {
  source     = "../SN"
  varsn      = var.versionsn
  depends_on = [module.vn-mod]
}

module "pi-mod" {
  source     = "../PI"
  varpi      = var.versionpi
  depends_on = [module.rg-mod]
}

module "ni-mod" {
  source     = "../NI"
  varni      = var.versionni 
  vardatapi = var.versionpi
  vardatasi = var.versionsn
  depends_on = [module.pi-mod, module.vn-mod, module.sn-mod]
}

module "vm-mod" {
  source     = "../VM"
  varvm      = var.versionvm
  vardatanic = var.versionni
  depends_on = [module.ni-mod, module.sn-mod]
}

module "nsg-mod" {
  source     = "../NSG"
  varnsg     = var.versionnsg
  depends_on = [module.rg-mod]

}


module "nsgni-mod" {
  source     = "../NSGNI"
  varnsgni   = var.versionnsgni
  depends_on = [module.ni-mod, module.nsg-mod]
}

