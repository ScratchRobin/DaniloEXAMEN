import time

print("Hola, Bienvenido!");
print("");
print("** FACTURACION DE PANTALONES **");
print("");
name = str(input("Ingrese su nombre: "));
cantidad = int(input("Cantidad de pantalones a llevar: "));
print("");
pago = float(cantidad * 160.50);
msg="";

if(cantidad <= 7):
    if(pago >700.00):
        desc = pago * 0.05;
        pago -= desc;
        msg = " (5% sobre el total a pagar)";
    else:
        desc = " Sin descuento";
        msg = " --------------";
elif (cantidad <= 10):
    desc = pago * 0.10;
    pago -= desc;
    msg = " (10% sobre el total a pagar)";
elif (cantidad > 10):
    desc = pago * 0.25;
    pago -= desc;
    msg = " (25% sobre el total a pagar)";

"""if (cantidad > 7):
    desc = pago * 0.10;
    pago -= desc;
    msg =" 10% sobre el total a pagar";
elif (cantidad > 10):
    desc = pago * 0.25;
    pago -= desc;
    msg =" 25% sobre el total a pagar";
elif (pago > 700.00):
    desc = pago * 0.05;
    pago -= desc;
    msg =" 5% sobre el total a pagar";
else:
    desc = " Sin descuento";
    msg =" --------------";"""

print("");
print("*==== RESUMEN DE FACTURA ====*");
print("");
print("Nombre del cliente: ",name);
print("Descuento: Q",desc,msg);
print("Total a pagar: Q",pago);
time.sleep(5);
print("");
print("Hasta pronto!!");
time.sleep(2);