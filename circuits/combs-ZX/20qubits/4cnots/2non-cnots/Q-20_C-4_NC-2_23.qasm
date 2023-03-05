OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[8];
x q[9];
cx q[15], q[10];
cx q[15], q[13];
z q[0];
cx q[9], q[19];
