OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
x q[19];
cx q[4], q[15];
z q[10];
cx q[15], q[1];
cx q[9], q[13];
cx q[13], q[0];
