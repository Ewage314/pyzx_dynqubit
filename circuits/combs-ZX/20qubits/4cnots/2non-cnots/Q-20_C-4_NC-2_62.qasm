OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[15];
x q[14];
cx q[16], q[3];
x q[7];
cx q[14], q[0];
cx q[3], q[19];
