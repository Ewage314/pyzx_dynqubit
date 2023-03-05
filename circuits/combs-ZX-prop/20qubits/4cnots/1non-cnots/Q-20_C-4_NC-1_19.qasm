OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[1], q[7];
cx q[15], q[1];
cx q[3], q[15];
z q[0];
cx q[1], q[14];
