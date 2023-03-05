OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[13];
cx q[6], q[1];
cx q[3], q[5];
x q[15];
cx q[7], q[12];
