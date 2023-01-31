OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
x q[6];
cx q[5], q[0];
cx q[3], q[6];
cx q[6], q[5];
cx q[6], q[7];
