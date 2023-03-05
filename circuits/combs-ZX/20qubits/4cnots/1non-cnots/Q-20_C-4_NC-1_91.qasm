OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
z q[7];
cx q[7], q[4];
cx q[17], q[18];
cx q[6], q[1];
cx q[16], q[13];
