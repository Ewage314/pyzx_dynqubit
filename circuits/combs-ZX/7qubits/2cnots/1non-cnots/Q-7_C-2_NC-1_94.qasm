OPENQASM 2.0;
include "qelib1.inc";
qreg q[7];
cx q[4], q[2];
z q[1];
cx q[4], q[1];
