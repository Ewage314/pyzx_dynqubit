OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[1];
cx q[18], q[15];
cx q[7], q[14];
x q[19];
cx q[19], q[3];
cx q[10], q[2];
