/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.BEAN;

/**
 *
 * @author Maria
 */
public class BeanInsumos {

    public int getId_insumo() {
        return id_insumo;
    }

    public void setId_insumo(int id_insumo) {
        this.id_insumo = id_insumo;
    }

    public String getNombre_insumo() {
        return nombre_insumo;
    }

    public void setNombre_insumo(String nombre_insumo) {
        this.nombre_insumo = nombre_insumo;
    }

    public String getDescripcion_insumo() {
        return descripcion_insumo;
    }

    public void setDescripcion_insumo(String descripcion_insumo) {
        this.descripcion_insumo = descripcion_insumo;
    }

    public String getUrl_insumo() {
        return url_insumo;
    }

    public void setUrl_insumo(String url_insumo) {
        this.url_insumo = url_insumo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getTallaInsumo_id_tallaInsumo() {
        return TallaInsumo_id_tallaInsumo;
    }

    public void setTallaInsumo_id_tallaInsumo(int TallaInsumo_id_tallaInsumo) {
        this.TallaInsumo_id_tallaInsumo = TallaInsumo_id_tallaInsumo;
    }

    public int getId_unidad_medida() {
        return id_unidad_medida;
    }

    public void setId_unidad_medida(int id_unidad_medida) {
        this.id_unidad_medida = id_unidad_medida;
    }

    private int id_insumo;
    private String nombre_insumo; 
    private String descripcion_insumo; 
    private String url_insumo;
    private double precio; 
    private int TallaInsumo_id_tallaInsumo; 
    private int id_unidad_medida; 
    public BeanInsumos(int id_insumo, String nombre_insumo, String descripcion_insumo, String url_insumo, double precio, int TallaInsumo_id_tallaInsumo, int id_unidad_medida) {
        this.id_insumo = id_insumo;
        this.nombre_insumo = nombre_insumo;
        this.descripcion_insumo = descripcion_insumo;
        this.url_insumo = url_insumo;
        this.precio = precio;
        this.TallaInsumo_id_tallaInsumo = TallaInsumo_id_tallaInsumo;
        this.id_unidad_medida = id_unidad_medida;
    }



    public BeanInsumos() {

    }
    


    }
