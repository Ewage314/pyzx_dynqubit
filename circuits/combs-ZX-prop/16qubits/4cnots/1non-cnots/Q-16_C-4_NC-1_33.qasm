OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[13];
cx q[7], q[12];
x q[9];
cx q[14], q[6];
cx q[10], q[8];
